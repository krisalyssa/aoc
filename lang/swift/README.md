# Swift

Initialize the project.

```shell
$ mkdir -p years/${YEAR}/swift
$ cd years/${YEAR}/swift
$ asdf local swift system
$ swift package init --type tool --name advent
Creating tool package: advent
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/advent.swift
```

Copy starter files from the global-lang Swift directory.

```shell
cp ../../../lang/swift/Package.swift Package.swift
cp -R ../../../lang/swift/Sources ../../../lang/swift/Tests .
```

Run the skeleton code.

```shell
$ swift run advent
...
Build complete! (6.85s)
Hello, world!
```
