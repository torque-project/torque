include build/core.mk

CC  := clang
CXX := clang++

# $(eval $(call SUBDIR, .))
$(eval $(call SUBDIR, lib/rev))
$(eval $(call SUBDIR, lib/rev/tools))

include build/targets.mk
