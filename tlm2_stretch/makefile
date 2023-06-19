
ENZYME_so=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-15.so

all-stretch: cmp-stretch ad-stretch opt-stretch lower-stretch
	echo done

cmp-stretch:
	clang-15 stretch.c -S -emit-llvm -o stretch-cmp.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops

ad-stretch:
	opt-15 stretch-cmp.ll -enable-new-pm=0 -load=$(ENZYME_so) --enzyme -o stretch-ad.ll -S

opt-stretch:
	opt-15 stretch-ad.ll -O2 -o stretch-opt.ll -S

lower-stretch:
	clang-15 -o stretch stretch-opt.ll

clean:
	rm -f stretch *.ll *~
