# OneOps Build Converter

An attempt to create a single OneOps product build.

Clone all the repositories we want to merge into a single repository:

```
./convert-clone.sh
```

Run the conversion script:

```
./convert.sh
```

Try out the Maven build:

```
mvn clean test -fae
```

This way we can see the failures at the end of the build.

To try this repeatedly set all the POMs back in their respective repositories with:

```
./convert-reset.sh
```

and then run the conversion script again:

```
./convert.sh
```

### TODO

- The merging of all the histories needs to be sorted out. there are many utilities that exist.
