# Atlassian confluence brushes

## Description

### shBrushPuppet.js
is an extension for the SyntaxHighlighter
[https://github.com/syntaxhighlighter](https://github.com/syntaxhighlighter)
created by Alex Gorbatchev that offers highlighting for puppet manifests

### confluencePuppetBrush.js
is an addon for confluence to enable puppet syntax highlighting within the code marco, based on the
SyntaxHighlighter.

![Puppet Syntax Highlighting](https://github.com/ktklin/atlassian/blob/master/brushes/puppet.png "Puppet")

Due to the old version of the SyntaxHighlighter extension used by confluence the
inline style modification features are limited (at least i did not find solution yet).
Changes the color / look & feel of certain elements can be done by adding additional css
informations to the global css
(maintainable throughout the admin section of confluence)

For example
``.puppet .op { color:white; font-weight:bold;}  ``
to change the color / font-weight of the '=>' operator to white  & bold

## Authors

Kurt Klinner - [ktklin](https://github.com/ktklin) - https://mobux.de

## License

This project is licensed under the GPL v3 license - see the [LICENSE.md](LICENSE.md) file for details
