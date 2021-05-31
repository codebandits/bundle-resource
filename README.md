# Bundle Resource

This Concourse resource publishes and versions [Carvel bundles](https://carvel.dev/imgpkg/docs/latest/resources/#bundle) in image registries.

## Resource Type Configuration

The image is hosted at `us-docker.pkg.dev/tools-275701/codebandits/bundle-resource`.

Example:

```yaml
resource_types:
  - name: bundle
    type: docker-image
    source:
      repository: us-docker.pkg.dev/tools-275701/codebandits/bundle-resource
      tag: latest
```

## Source Configuration

- `registry`: *Required*. The location of the registry.
- `repository`: *Required*. The repository for this bundle.
- `username`: *Required*. Used when authenticating to the registry.
- `password`: *Required*. Used when authenticating to the registry.

Example:

```yaml
resources:
  - name: myapp-bundle
    type: bundle
    source:
      registry: us-docker.pkg.dev
      repository: myorg/myapp
      username: ((registry-username))
      password: ((registry-password))
```

## CI/CD Pipeline [![CI/CD Pipeline](https://ci.distro.beer/api/v1/teams/codebandits/pipelines/bundle-resource/badge)](https://ci.distro.beer/teams/codebandits/pipelines/bundle-resource)

https://ci.distro.beer/teams/codebandits/pipelines/bundle-resource

Set the pipeline:

```
fly --target codebandits login --team-name codebandits --concourse-url https://ci.distro.beer
fly --target codebandits set-pipeline --pipeline bundle-resource --config pipeline/pipeline.yml
```

Set the pipeline secrets:

```
cd pipeline
./apply-pipeline-secrets.sh
```
