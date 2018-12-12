# Ystia Forge Changelog

## UNRELEASED

### BUG FIXES

* Component NFS Client fails to mount directory exported by NFS server on GCP ([GH-38](https://github.com/ystia/forge/issues/38))

## 2.1.0-M7 (December 07, 2018)

### NEW FEATURES

* Provide Consul components/topology allowing to install a secured Consul setup ([GH-28](https://github.com/ystia/forge/issues/28))
* Support of Yorc bootstrap ([GH-32](https://github.com/ystia/forge/issues/32))

### IMPROVEMENTS

* TerraformRuntime component should have a download URL in argument ([GH-22](https://github.com/ystia/forge/issues/22))

## 2.1.0-M6 (November 16, 2018)

### DEPENDENCIES

* Ystia Forge components require now Alien4Cloud 2.1.0-SM7
* Ystia Forge components require now Alien4Cloud CSAR public library 2.1.0-SM7

### BUG FIXES

* Yorc AnsibleRuntime component creation fails on CentOS 7 on AWS ([GH-30](https://github.com/ystia/forge/issues/30))


## 2.1.0-M5 (October 26, 2018)

### NEW COMPONENTS

* Google Compute Engine Infrastructure configuration ([GH-23](https://github.com/ystia/forge/issues/23))

## 2.1.0-M4 (October 08, 2018)

### DEPENDENCIES

* Ystia Forge components require now Alien4Cloud 2.1.0-SM6
* Ystia Forge components require now Alien4Cloud CSAR public library 2.1.0-SM6

### NEW COMPONENTS

* Slurm scheduler and its dependencies ([GH-20](https://github.com/ystia/forge/issues/20)):
  * NTP
  * Dnsmasq
  * Resolvconf
  * Munge

### IMPROVEMENTS

* Ystia Forge Consul components at org/ystia/experimental/consul/ install now Consul 1.2.3
