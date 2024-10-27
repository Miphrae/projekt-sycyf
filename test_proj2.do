restart -nowave -force
add wave -radix unsigned *
force clk 0 0, 1 10 -r 20
force rst 1 0, 0 1
force ena 1 0
force start 0 0, 1 40, 0 60
force data 2#1001011001101001 0, 2#0 80
run 2000
