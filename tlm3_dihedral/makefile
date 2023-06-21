
ENZYME_so=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-15.so

all-Dihed: cmp-Dihed ad-Dihed opt-Dihed lower-Dihed
	echo done

cmp-Dihed:
	clang-15 Dihed.cc -S -emit-llvm -o Dihed-cmp.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops

ad-Dihed:
	opt-15 Dihed-cmp.ll -enable-new-pm=0 -load=$(ENZYME_so) --enzyme -o Dihed-ad.ll -S

opt-Dihed:
	opt-15 Dihed-ad.ll -O3 -o Dihed-opt.ll -S

lower-Dihed:
	clang-15 -o Dihed Dihed-opt.ll -lstdc++ -lm

clean:
	rm -f Dihed *.ll *~
