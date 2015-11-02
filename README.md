
Introduction to xTalk3d
=======================

xTalk3d (crosstalk3d or xt3d for short) is an open-source, cross-platform, 3D graphics and game-development framework built with Haxe and Lime.

xTalk3d aims to provide a simple means of developing 3D games and applications for multiple platforms with optimised performance. 
Depending on the target platform it uses OpenGL, OpenGL ES or WebGL for graphics capabilities. 

It is able to do this by taking advantage of [Lime](https://github.com/openfl/lime) which provides both graphics and user-input back-end support.
Compilation of xt3d projects is done through the lime command-line tools.

Please visit [xTalk3d](https://github.com/stuartcaunt/xt3d) on Github for more information.

This repository provides samples and demos using xt3d to help developers wishing to use xt3d get started and to showcase some 
of the xt3d functionality.


Installation
============

Installion requires the xt3d library:

	haxelib install xt3d
	
Or you can just install directly the samples:

	haxelib install xt3d-samples

 
Getting started
===============

The samples are easily installed through haxelib and the lime command line:

To view all sample projects:

	lime create xt3d 
	
To install the lighting demo project:

	lime create xt3d:Lighting
	
To install a sample to a specific location just do:

	lime create xt3d:Lighting /destination
 
Currently the samples are very limited... more are on their way!

Note...
=======

xt3d is currently in an unstable development stage and is far from complete. If you come across this framework then please give it a try
and send me feedback. Please be aware that the API is likely to change!