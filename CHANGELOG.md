# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Built controller image from upstream commit `befab0a`.
- Remove `vipSubnet` from CAPVCD values to VCDCluster values.
- Remove deprecated configmap.

## [0.1.3] - 2022-08-01

### Fixed

- Add prefix to certificate secret to prevent conflict with other certificates.

## [0.1.2] - 2022-06-30

### Fixed

- Corrected issues with Chart.yaml

## [0.1.1] - 2022-06-29

### Changed

- Fix CI issues to ensure chart builds correctly

## [0.1.0] - 2022-06-24

### Added

- Initial chart implementation
- Install CRDs via job

[Unreleased]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.3...HEAD
[0.1.3]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/releases/tag/v0.1.0
