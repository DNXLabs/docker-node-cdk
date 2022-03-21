# docker-node-cdk

![Security](https://github.com/DNXLabs/docker-node-cdk/workflows/Security/badge.svg)
![Lint](https://github.com/DNXLabs/docker-node-cdk/workflows/Lint/badge.svg)

Docker image containing AWS CLI, AWS Shell, and AWS CDK.

## Dependencies
- Docker

## Usage

### Build Locally

If you want to build and use your own local image

```bash
# build image locally
$ make build
# go inside the container
$ make shell
```

## Update Docker image

1. Change (or not) `VERSION` in `Makefile`
2. Build and test locally
3. Commit and push the changes
4. Tag the commit with the command `make gitTag`
5. Go to [hub.docker.com](hub.docker.com)
6. In `Build Details` tab, you should now see the new tag kicking off

Docker image
------------

The Docker image has the following:

- Alpine
- [aws-cli](https://github.com/aws/aws-cli)
- [aws-shell](https://github.com/awslabs/aws-shell)
- [aws-cdk](https://github.com/aws/aws-cdk)
- envsubst: quite useful to create file based on a template using env vars

## Author

Managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/docker-node-cdk/blob/master/LICENSE) for full details.