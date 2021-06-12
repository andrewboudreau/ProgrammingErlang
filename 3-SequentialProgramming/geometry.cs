using System;

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
