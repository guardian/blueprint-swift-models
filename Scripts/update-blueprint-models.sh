#!/bin/bash

# Check if protoc is installed
if ! command -v protoc &> /dev/null
then
    echo "Error: protoc is not installed. Please install the Protocol Buffers compiler. `brew install protobuf`"
    exit 1
fi

if ! command -v mint &>/dev/null; then
    echo "Error: Mint is not installed. Follow the instructions in the project's README to install it, and then
    run this script again."
    exit 1
fi

# Get swift-protobuf version from Package.resolved
PACKAGE_RESOLVED="../Package.resolved"
SWIFT_PROTOBUF_VERSION=$(grep -A 5 '"identity" *: *"swift-protobuf"' "$PACKAGE_RESOLVED" | grep '"version"' | awk -F'"' '{print $4}')

if [[ -z "$SWIFT_PROTOBUF_VERSION" ]]; then
    echo "Error: Could not find swift-protobuf version in Package.resolved"
    exit 1
fi

echo "Swift Protobuf version: $SWIFT_PROTOBUF_VERSION"

# Build protoc-gen-swift at the correct version (cached)
CACHE_DIR="${HOME}/.swift-protobuf-cache"
BINARY_PATH="${CACHE_DIR}/${SWIFT_PROTOBUF_VERSION}/protoc-gen-swift"

if [[ ! -f "$BINARY_PATH" ]]; then
    echo "Building protoc-gen-swift $SWIFT_PROTOBUF_VERSION..."
    mkdir -p "${CACHE_DIR}/${SWIFT_PROTOBUF_VERSION}"

    BUILD_DIR=$(mktemp -d)
    git clone --depth 1 --branch "$SWIFT_PROTOBUF_VERSION" https://github.com/apple/swift-protobuf.git "$BUILD_DIR"
    cd "$BUILD_DIR"

    # Workaround:  Use the Swift 5.10 package manifest (doesn't include problematic protoc target)
    cp Package@swift-5.10.swift Package.swift

    swift build -c release --product protoc-gen-swift
    cp .build/release/protoc-gen-swift "$BINARY_PATH"

    cd - > /dev/null
    rm -rf "$BUILD_DIR"

    echo "✅ Built and cached protoc-gen-swift $SWIFT_PROTOBUF_VERSION"
else
    echo "✅ Using cached protoc-gen-swift $SWIFT_PROTOBUF_VERSION"
fi

pwd # Print the current working directory
framework_folder="../Sources/BlueprintModels/Proto"

# Generate updated swift files with from the latest proto file
protoc --descriptor_set_out=${framework_folder}/blueprint.desc \
       --plugin=protoc-gen-swift="$BINARY_PATH" \
       --swift_opt=Visibility=Internal \
       --swift_out=${framework_folder} \
       --proto_path=${framework_folder} \
       "${framework_folder}/blueprint.proto"

# Generate the simple BlueprintModels from the latest proto file
swift run SwiftBuffet \
       --swift-prefix Blueprint \
       --include-protobuf true\
       --local-id-messages Card\
       --store-backing-data true\
       -q \
       "${framework_folder}/blueprint.proto" \
       "${framework_folder}/blueprint.swift"
