# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.5.0] - 2023-04-04

### Added

- Bump api version of cloud-director CRs from v1beta1 to v1beta2.

## [0.4.1] - 2023-02-20

## [0.4.0] - 2023-01-30

### Added

- Support for vm naming.

### Fixed

- Wrong IP for kube-api LB when multiple NICs are used.

## [0.3.2] - 2022-12-27

### Changed

- Add toleration and priorityClass to be able to run capvcd controller on control plane nodes.
- Fix wrong IP in load balancer pool when there are multiple NICs. 

## [0.3.0] - 2022-12-13

### Added

- Support multi-nic for machines.

## [0.2.6] - 2022-12-01

### Changed

- Consume `5436e90` from `giantswarm` fork to bring `clusterctl move` fix.

## [0.2.5] - 2022-11-15

### Added

- Kustomize support to generate helm manifests from upstream repos automatically.

## [0.2.4] - 2022-10-25

### Changed

- Updated CRDs, charts and built controller image from upstream commit `6077656`.
- Added skipRDE switch to set env variable.

## [0.2.3] - 2022-08-25

### Changed

- Built controller image from upstream commit `e6a551d` which removes CPI, CSI and default class from cloud-init.

## [0.2.2] - 2022-08-17

### Fixed

- Built controller image from upstream commit `0fa7fa9` with fix to cloud-init.
- New build includes new `skipRDE` switch which include `RdeID` to `VCDCluster` when __NO_RDE__ is used to fix `clusterctl move`.

## [0.2.1] - 2022-08-10

### Fixed

- Built controller image from upstream commit `8a5e8da` with fix to cloud-init.
- Fixes cloud-init trying to pull CPI and CSI images from the wrong repos (main branch).

## [0.2.0] - 2022-08-08

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

[Unreleased]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.5.0...HEAD
[0.5.0]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.4.1...v0.5.0
[0.4.1]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.3.2...v0.4.0
[0.3.2]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.6...v0.3.0
[0.2.6]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.5...v0.2.6
[0.2.5]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.4...v0.2.5
[0.2.4]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.3...v0.2.0
[0.1.3]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/cluster-api-provider-cloud-director-app/releases/tag/v0.1.0
