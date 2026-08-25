## BlueprintModels

These models are used to communicate between MAPI and the native apps. This repository defines the Swift models for "blueprint" collections, generated from the protobuf [schema](https://github.com/guardian/mobile-apps-api-models/blob/main/proto/blueprint.proto) with the help of [SwiftBuffet](https://github.com/guardian/swift-buffet).

### How do I update the models?

A GitHub Action, [Sync blueprint.proto](.github/workflows/sync-blueprint-proto.yml), runs on a daily schedule (and can also be triggered manually via `workflow_dispatch`). It checks whether `proto/blueprint.proto` has changed on the `main` branch of [mobile-apps-api-models](https://github.com/guardian/mobile-apps-api-models).

If a change is detected, the workflow will:

1. Copy the updated `blueprint.proto` into this repo and remove the stale generated files.
2. Regenerate the Swift models by running `Scripts/update-blueprint-models.sh`.
3. Open a pull request (branch `automated/update-blueprint-proto`) containing the updated proto file and regenerated models for review.

No PR is opened if the upstream file hasn't changed. Any resulting PR should still be reviewed manually before merging, in case the generated diff needs attention.

### Manual updates (fallback)

If you need to update the models without waiting for the scheduled sync — for example, to work with proto file changes that are not currently live, such as those on a branch for a future release in the Code environment — you can run the update-blueprint-models.sh script yourself.

The [mobile-apps-api-models](https://github.com/guardian/mobile-apps-api-models) repo contains the blueprint.proto file. Copy a version of this file and replace ./BlueprintModels/Sources/BlueprintModels/Proto/blueprint.proto within this repo. Also, delete the generated swift files.

Run the update-blueprint-models.sh script from the ./Scripts/ folder. The script knows the location of the blueprint.proto file and will update the swift-protobuf and Swift Buffet files to reflect any local changes to the blueprint.proto file.
