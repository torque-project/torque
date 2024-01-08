include build/core.mk

CC  := clang
CXX := clang++

# $(eval $(call SUBDIR, .))
$(eval $(call SUBDIR, lib/rev))
$(eval $(call SUBDIR, lib/rev/tools))
$(eval $(call SUBDIR, lib/compiler/lib/abi))
$(eval $(call SUBDIR, lib/compiler/lib/jit))

include build/targets.mk
