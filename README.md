## CSC453 - Ruby Extension




#### Basic info

CSC453 / Jiupeng Zhang



#### Environment
Develop under Ruby 2.5.1p57



#### Structure of directory

```
hw04
├── README.md *
├── CFixedArray.c       (src)
├── CFixedArray.o
├── CFixedArray.bundle
├── RubyFixedArray.rb   (src)
├── FixedArrayTest.rb   (test)
├── Compare.rb          (test)
├── Makefile
├── extconf.h
├── extconf.rb
└── mkmf.log
```



#### Source codes

1. CFixedArray:			 `/path/to/hw04/CFixedArray.c`
2. RubyFixedArray:		 `/path/to/hw04/RubyFixedArray.rb`
3. Basic Function Test:	 `/path/to/hw04/FixedArrayTest.rb`
4. Comparision:		 `/path/to/hw04/Compare.rb`



#### How to run

`ruby FixedArrayTest.rb`

`ruby Compare.rb`



#### Performance

> **CFixedArray:**  Avg 0.002234 ms.
>
> **RubyFixedArray:** Avg 0.056543 ms.

Obviously, the C extension is much faster (25x faster in this case) than a pure Ruby implementation. Although ruby was a C based language, it has extra data structures to keep (but never needed in *this* tiny program) to support a versatile ruby array.

However, the built-in Ruby array has way more functionality than a plain C array (not only the auto-resizing but also methods like slice, each, etc.) which leads to a trade-off between development efficiency and runtime performance.

That is to say, if I need to use many of the advanced methods of an array, ruby array itself is not a bad choice as its neat and simple to use, but if I have a strict demand on runtime efficiency, we could make use of that strong utility of ruby c extension to fulfill specific requirements like compute-intensive applications, core components, and underlying programs, etc.