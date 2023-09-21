# Low-level IR in Mojo

Mojo is a high-level programming language with an extensive set of modern features. But Mojo also provides you, the programmer, access to all of the low-level primitives that you need to write powerful – yet zero-cost – abstractions.

These primitives are implemented in MLIR, an extensible intermediate representation (IR) format for compiler design. Many different programming languages and compilers translate their source programs into MLIR, and because Mojo provides direct access to MLIR features, this means Mojo programs can enjoy the benefits of each of these tools.

Going one step further, Mojo’s unique combination of zero-cost abstractions with MLIR interoperability means that Mojo programs can take full advantage of anything that interfaces with MLIR. While this isn’t something normal Mojo programmers may ever need to do, it’s an extremely powerful capability when extending a system to interface with a new datatype, or an esoteric new accelerator feature.

To illustrate these ideas, we’ll implement a boolean type in Mojo below, which we’ll call OurBool. We’ll make extensive use of MLIR, so let’s begin with a short primer.

## What is MLIR?

MLIR is an intermediate representation of a program, not unlike an assembly language, in which a sequential set of instructions operate on in-memory values.

More importantly, MLIR is modular and extensible. MLIR is composed of an ever-growing number of “dialects.” Each dialect defines operations and optimizations: for example, the ‘math’ dialect provides mathematical operations such as sine and cosine, the ‘amdgpu’ dialect provides operations specific to AMD processors, and so on.

Each of MLIR’s dialects can interoperate with the others. This is why MLIR is said to unlock heterogeneous compute: as newer, faster processors and architectures are developed, new MLIR dialects are implemented to generate optimal code for those environments. Any new MLIR dialect can be translated seamlessly into other dialects, so as more get added, all existing MLIR becomes more powerful.

This means that our own custom types, such as the OurBool type we’ll create below, can be used to provide programmers with a high-level, Python-like interface. But “under the covers,” Mojo and MLIR will optimize our convenient, high-level types for each new processor that appears in the future.

There’s much more to write about why MLIR is such a revolutionary technology, but let’s get back to Mojo and defining the OurBool type. There will be opportunities to learn more about MLIR along the way.
