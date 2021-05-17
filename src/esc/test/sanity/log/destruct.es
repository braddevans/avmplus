var [
x, y, z
]
= [10, 20, 30]
print(x, y, z)
var {
a, b
:
b, c
:
c
}
= {a: 10, b: 20, c: 30}
print(a, b, c)

function f(

[x, y, z],
{
    a, b
:
    b, c
:
    c
}
)
{
    print(x, y, z);
    print(a, b, c);
}
f([10, 20, 30], {a: 10, b: 20, c: 30});