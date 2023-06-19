
ENZYME_so=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-15.so

all-simple: cmp-simple ad-simple opt-simple lower-simple
	echo done

cmp-simple:
	clang-15 simple.c -S -emit-llvm -o simple-cmp.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops

ad-simple:
	opt-15 simple-cmp.ll -enable-new-pm=0 -load=$(ENZYME_so) --enzyme -o simple-ad.ll -S

opt-simple:
	opt-15 simple-ad.ll -O2 -o simple-opt.ll -S

lower-simple:
	clang-15 -o simple simple-opt.ll

clean:
	rm -f simple *.ll *~
