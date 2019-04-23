# haskell-bio

Small library of biological functions implemented in haskell

Modules:

+ BWTlib
  + General BWT construction and searching functions, useful for indexing of large genetic sequences
  + Exposed Functions:
    + constructBWT: Build a BWT string from input string, returning encoded string
    + decodeBWT:    Decode BWT string into original string
