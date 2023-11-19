# Swift

Initialize the project.

```shell
$ cd years/${YEAR}
$ mkdir swift
$ cd swift
$ swift package init --type tool --name advent
Creating tool package: advent
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/advent.swift
$ cp ../../../lang/swift/Package.swift.sample Package.swift
$ cp -R ../../../lang/swift/Tests .
```

Run the skeleton code.

```shell
$ swift run advent
...
Build complete! (6.85s)
Hello, world!
```

Set up XCTest.

```shell
swift test generate-linuxmain
```
