# GenModule

Generate a simple module file and test file
```
>mix gen_module CuteDogs
Files created:
  lib/gen_module/cute_dogs.ex
  test/cute_dogs_test.exs
```

## Installation
mix archive.install https://raw.githubusercontent.com/ericridgeway/gen_module/master/gen_module/gen_module-current.ez

## Notes for updating this proj
- \<merge working into master\>
- mix version.inc
- mix archive.build
- mix archive.build -o gen_module-current.ez
- \<commit master\>
- \<push master\>

## Todo notes
I think there's a more standard correct way to do the version #s and tags and have an archive directory?
