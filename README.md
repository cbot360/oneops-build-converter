# OneOps Build Converter

An attempt to create a single OneOps product build.

## Prerequisites

- git
- Unix shell environment (bash)
- JDK 8
- Graphviz

## Usage

Run the conversion script:

```
./convert.sh
```

Try out the Maven build:

```
./mvnw clean package
```

This should produce all the packages and produce a final distribution that closely resembles the current OneOps distribution. You can find the distribution in `oneops/target/`

## TODO

- The merging of all the histories needs to be sorted out. there are many utilities that exist.
