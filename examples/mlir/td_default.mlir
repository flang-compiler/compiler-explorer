 transform.sequence failures(propagate) {
 ^bb1(%variant_op: !pdl.operation):
   %copy = transform.structured.match ops{["linalg.copy"]} in %variant_op
     : (!pdl.operation) -> !pdl.operation
 
   %forall_l1, %copy_l1 =
     transform.iree.tile_to_forall_and_workgroup_count_region %copy num_threads [2]
       ( mapping = [#gpu.block<x>] )
 
   // Late canonicalizations and cleanups.
   transform.iree.apply_patterns %variant_op
     {canonicalization, cse, licm, tiling_canonicalization}
     : (!pdl.operation) -> ()
 }
 
