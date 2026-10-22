+++
date = "2016-01-20T11:31:54+09:00"
title = "Engineering & open source"
description = "Go services, Kubernetes and VM operations, Tailscale networking, and past contributions to Gonum and scientific software."
weight = 1
eyebrow = "Services, systems & scientific computing"
+++

## Current engineering work

I work as a Principal System Integration Engineer, developing internal services and looking after the infrastructure that runs and connects them.

### Go services & operations

I develop internal services in Go and deploy them to our internal Kubernetes cluster or to virtual machines. My responsibilities cover deployment, monitoring, maintenance, and bug fixing, keeping me involved throughout the life of a service.

### Networking & security

I’m the technical owner of our internal Tailscale VPN. I design the network architecture connecting client devices with on-premises and cloud services, virtual machines, and workloads.

This also means working through routing and DNS issues and handling the network administration and security considerations behind those connections. Secure networking and zero-trust architectures are a particular area of interest.

## Gonum

I’ve been a major contributor to [Gonum](https://gonum.org/), a collection of numerical libraries for Go. It brings together two important parts of my background: software engineering and scientific computing.

My contributions are part of my earlier open-source work; I’m not actively contributing at present.

## Earlier projects

These projects come from my work in scientific computing, numerical methods, and geometry processing. They are collected here as a record of past work.

### [umeshu](https://github.com/vladimir-ch/umeshu/)

A light-weight, open-source C++ library implementing half-edge data structure and algorithms for generating triangular
meshes in polygonal domains by Delaunay refinement.

### [phf-snakes](https://github.com/vladimir-ch/phf-snakes/)

A C++/OpenMP implementation of an image segmentation algorithm described in the paper M. Beneš, V.  Chalupecký, and K.
Mikula, _Geometrical image segmentation by the Allen-Cahn equation_. Applied Numerical Mathematics, **51** (2004),
187–205.

### [concrete-corrosion](https://github.com/vladimir-ch/concrete-corrosion/)

An implementation of a multi-scale ODE/PDE model of concrete corrosion as described in the lecture notes A. Muntean, V.
Chalupecký, "[_Homogenization Method and Multiscale
Modeling_](http://www.imi.kyushu-u.ac.jp/eng/publishes/pub_inner/id:2/cid:15)", COE Lecture Notes Series Vol. **34**,
Kyushu University (2011).

### [thin-plate-splines](https://github.com/vladimir-ch/thin-plate-splines/)

A tiny C++ library for data interpolation/transformation/deformation using polyharmonic splines.

### [polar-decomposition](https://github.com/vladimir-ch/polar-decomposition/)

A tiny C++ routine for computing the polar decomposition of square matrices using an iterative algorithm proposed in N.
Higham, _Computing the polar decomposition with applications_. SIAM J. Sci. Stat. Comput. **7**(4) (1986), 1160–1174.
[doi:10.1137/0907079](http://dx.doi.org/10.1137%2F0907079).

### [odeity](https://github.com/vladimir-ch/odeity/)

A small C++ library for solving systems of ODEs with a focus on systems arising in the semi-discretization of partial
differential equations. It implements several explicit variable-step Runge-Kutta methods and provides an interface to
the [CVODE](https://computation.llnl.gov/casc/sundials/main.html) library.

### OpenFlipper plugins

Plugins for [OpenFlipper](http://www.openflipper.org/) geometry processing framework:

#### [Plugin-Align](https://github.com/vladimir-ch/Plugin-Align)

This plugin aligns two triangular or polyhedral meshes using PCA with an optional rescaling.

#### [Plugin-ExtractSurface](https://github.com/vladimir-ch/Plugin-ExtractSurface)

This plugin creates a `TriMesh` or `PolyMesh` from boundary faces of a `PolyhedralMesh` or `HexahedralMesh`.
