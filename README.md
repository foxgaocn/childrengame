# ChildrenGame

### The problem:
Consider the following children’s game:
* n children stand around a circle. 
* Starting with a given child and working clockwise, each child gets a sequential number, which we will refer to as it’s id. 
* Then starting with the first child, they count out from 1 until k. The k’th child is now out and leaves the circle. The count starts again with the child immediately next to the eliminated one.
* Children are so removed from the circle one by one. The winner is the child left standing last.

Implement the game such that, when you enter n and k, it returns the sequence of children as they go out, and the id of the winning child.

### The design
The problem can be abstracted as "keep removing K'th node in a circle with N nodes until the last one"

Two ruby classes are created to model this problem. The ChildCircle class is a circular linked list, and the Child class is the Node. The ChildCircle has a remove_at method, which will remove the node in specified position.

The performance of this design:
* Time: O(N log N)
* Space: O(N)

### How to run
#### If you have ruby environment in your local machine
```ruby
git clone git@github.com:foxgaocn/childrengame.git
cd  childrengame
./bin/setup
```
To run all tests:
```
rake
```

To run unit tests only:
```
rake spec
```

To run BDD tests only:
```ruby
rake features
```

To run the program:
```
./bin/run play -t 5 -p 3
```
where -t is the total number of the children in the circle
-p is the position where the child should be removed

#### If you don't have ruby environment
You can get the docker image and run the program.
To run all tests:
```
docker run --rm -t foxgaocn:children_game rake
```

To run unit tests only:
```
docker run --rm -t foxgaocn:children_game rake spec
```

To run BDD tests only:
```ruby
docker run --rm -t foxgaocn:children_game rake features
```

To run the program:
```
docker run --rm -t foxgaocn:children_game ./bin/run play -t 5 -p 3
```
where -t is the total number of the children in the circle
-p is the position where the child should be removed
