# zap-analyzer

A cli that helps you sort through the results of an OWASP ZAP scan.

`zap-analyzer` helps you triage issues to help you focus your time chasing errors by identifying likely false positives. Ideally, the reports generated by `zap-analyzer` could be tuned to a specific framework or stack (e.g. Jekyll, Rails, and Django).

## Installation

### Dependencies

- Ruby or Docker

### Docker installation

#### Pull from the Docker Hub

```
$ docker pull adelevie/zap-analyzer
```

#### Build the Docker image locally

Clone this repo and `cd` into it. Then build the image:

```
$ docker build -t zap-analyzer .
```

### Ruby installation

Clone this repo and `cd` into it. Then install the dependencies:

```
$ bundle install
```

## Usage

The data source for `zap-analyzer` are JSON files of OWASP ZAP output scans.

18F stores these files publicly on compliance-viewer-18f.gov. An example of one of these files can be found [here](https://compliance-viewer.18f.gov/results/micropurchase/current?format=json).

Pipe this JSON into the `zap-cli`:

## Docker usage

### Pulling from the Docker Hub

```
$ curl https://compliance-viewer.18f.gov/results/micropurchase/current?format=json | docker run -i adelevie/zap-analyzer
```

### After building locally

```
$ curl https://compliance-viewer.18f.gov/results/micropurchase/current?format=json | docker run -i zap-analyzer
```

If you want to write the report to a file:

```
$ curl https://compliance-viewer.18f.gov/results/micropurchase/current?format=json | docker run -i zap-analyzer > report.md
```

## Ruby usage

From the root of the `zap-analyzer` project folder:

```
$ curl https://compliance-viewer.18f.gov/results/micropurchase/current?format=json | bin/cli
```

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
