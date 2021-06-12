# Programming Erlang
Journal for working through [Programming Erlang by Joe Armstrong](https://pragprog.com/titles/jaerlang2/programming-erlang-2nd-edition/). I guess I ended up with the first edition but it was only $6. The goal here is to learn some of the larger concepts of Erlang and functional programming in general.

# CSharp 9 variants
In an attempt better develop my personal understanding, I will try implement some of the newer C# 9.0 features, such as pattern matching into these examples where I see fit. The goal is not to force any language paradigm mismatches (erlang/csharp), but to explore some of the fundamentals concepts behind the new C# 9 features and better understand their usage scenarios.

In example, here is the pattern matching scenario described on pg 35.
*Erlang*
```erlang
-module(geometry).
-export([area/1]).
area({rectangle, Width, Height}) -> Width * Height;
area({circle, R})                -> 3.14159 * R * R;
area({square, Side})             -> Side * Side.
```

*C#*
```csharp
Console.WriteLine(Area(new Square(3)));
Console.WriteLine(Area(new Rectangle(3,4)));
Console.WriteLine(Area(new Circle(2)));

static double Area(Shape shape) => 
    shape switch {
        Square s => s.Side * s.Side,
        Circle c => c.Radius * 3.14159,
        Rectangle r => r.Width * r.Height,
        _ => throw new NotSupportedException($"{nameof(shape)} is not a supported shape for Area().")
    };

record Shape();
record Square(int Side) : Shape();
record Circle(int Radius) : Shape();
record Rectangle(int Width, int Height) : Shape();
```