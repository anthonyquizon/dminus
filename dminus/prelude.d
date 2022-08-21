module dminus.prelude;

import core.stdc.stdlib : atoi;
import core.stdc.stdio : sprintf;
import core.bitop;
import core.stdc.string : strlen, memcmp;
import core.stdc.stddef : wchar_t;
import C=core.stdc.stdio;
import core.stdc.stdlib, core.sys.posix.unistd;

public import core.stdc.stdio : FILE;

alias つ = string, し = size_t, ひ=double, ろ=bool, ʘ=void, の=char, ㄅ=ubyte, ㄋㄙ=uint, ㄙ=int, 〆=ulong, て=float;

mixin template opBi(
    A, つ[] f0
) {
    static foreach (k; f0) { A opBinary(つ op: k)(A r) { return _opBi!(k)(this, r); } }
}

mixin template opBi(
    A, つ[] f0,
    B, つ[] f1
) {
    static foreach (k; f0) { A opBinary(つ op: k)(A r) { return _opBi!(k)(this, r); } }
    static foreach (k; f1) { A opBinary(つ op: k)(B r) { return _opBi!(k)(this, r); } }
}

mixin template opBi(
    A, つ[] f0,
    B, つ[] f1,
    C, つ[] f2
) {
    static foreach (k; f0) { A opBinary(つ op: k)(A r) { return _opBi!(k)(this, r); } }
    static foreach (k; f1) { A opBinary(つ op: k)(B r) { return _opBi!(k)(this, r); } }
    static foreach (k; f2) { A opBinary(つ op: k)(C r) { return _opBi!(k)(this, r); } }
}

mixin template opBi(
    A, つ f0 = [], 
    B, つ f1 = [],
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return _opBi!f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return _opBi!f(this, r); } }
}

mixin template opBi(
    A, つ f0 = [], 
    B, つ f1 = [],
    C, つ f2 = [],
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return _opBi!f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return _opBi!f(this, r); } }
    static foreach (k, f; f2) { A opBinary(つ op: k)(C r) { return _opBi!f(this, r); } }
}

mixin template opBi(
    A, alias f0
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return f(this, r); } }
}

mixin template opBi(
    A, alias f0 = [], 
    B, alias f1 = [],
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return f(this, r); } }
}

mixin template opBi(
    A, alias f0 = [], 
    B, alias f1 = [],
    C, alias f2 = []
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return f(this, r); } }
    static foreach (k, f; f2) { A opBinary(つ op: k)(C r) { return f(this, r); } }
}

mixin template opBiR(
    A, 
    B, alias f1 = [],
) {
    static foreach (k, f; f1) { B opBinaryRight(つ op: k)(B l) { return f(l, this); } }
}

mixin template opBiR(
    A, 
    B, alias f1 = [],
    C, alias f2 = []
) {
    static foreach (k, f; f1) { B opBinaryRight(つ op: k)(B l) { return f(l, this); } }
    static foreach (k, f; f2) { C opBinaryRight(つ op: k)(B l) { return f(l, this); } }
}
