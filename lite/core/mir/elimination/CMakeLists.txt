if (NOT LITE_WITH_LIGHT_WEIGHT_FRAMEWORK)
  # NOTE disabled for the proto_desc is not valid yet.
  # TODO(Superjomn) enable them if valid latter.
  # lite_cc_test(test_identity_scale_eliminate_pass
  #   SRCS identity_scale_eliminate_pass_test.cc
  #   DEPS mir_passes program proto_desc cpp_op_desc
  #   ${ops}
  #   )
endif()
 
