# graPharo
Repository for my Google Summer of Code project

<p>Project I will be working on is: <strong>Graph library with layouting algorithms</strong>. I will create a separate reusable library for graph structure and traversing algorithms. Also, it will contain various algorithms for different layouts for graph visualisation.</p>

<p> Some of these structures, already exist implemented in Pharo, as a part of some other projects. But this will be the first library that will contain all of it in one place.</p>

I will be documenting progress on my blog [Pharokeepers](https://pharokeepers.github.io/) and with occasional [tweet](https://twitter.com/medicka992) . 

You can read about Google Summer of Code on this link: [GSoC](https://summerofcode.withgoogle.com/) , about [Pharo](https://pharo.org/) and if you are interested you can also read my [proposal](https://docs.google.com/document/d/1V8_HaZnxYsCfaiZs4vI1C5Dh4TvRPz-H51aYOuY9lFA/edit?usp=sharing) for this project.

As a final part of the project, I have created a [booklet](graPharo.pdf) that documents what is contained in the library and how to use it.

## Installation 
Execute the following incantation in a Playground:


```Smalltalk
Metacello new
 baseline:'GraphLayout';
 repository: 'github://medicka/graPharo:master';
 load.
```
