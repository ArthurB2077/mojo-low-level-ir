struct OurBool:
    var value: __mlir_type.i1

    fn __init__(inout self):
        self.value = __mlir_op.`index.bool.constant`[
            value: __mlir_attr.`false`,
        ]()