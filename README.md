## BlueprintModels

These models are used to communicate between MAPI and the native apps. This repository defines the Swift models for "blueprint" collections, generated from the protobuf [schema](https://github.com/guardian/mobile-apps-api-models/blob/main/proto/blueprint.proto) with the help of [SwiftBuffet](https://github.com/guardian/swift-buffet).

### How do I update the models? 

You can update the models by running the update-blueprint-models.sh script. The [mobile-apps-api-models](https://github.com/guardian/mobile-apps-api-models) repo contains the contains a blueprint.proto file, copy a version of this file and replace ./BlueprintModels/Sources/BlueprintModels/Proto/blueprint.proto within this repo.

Run the update-blueprint-models.sh script from the ./Scripts/ folder. The script knows the location of the blueprint.proto file and will update the swift-protobuf and Swift Buffet files to reflect any local changes to the blueprint.proto file.

This can be especially useful for working with proto file changes that are not currently live, like in the Code environment on a branch for a future release.
