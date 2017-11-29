#! /usr/bin/python3

import sys

###############################################################################
# HELPERS
###############################################################################

ELEMENTS="fFtTor- "
TREE_ELEMENTS="fFtTr"

def SUCCESS(msg):
    print("SUCCESS:" + msg)

def FAILED(msg):
    print("FAILED:" + msg)

def create_string_list_from_file(filename):
    rst=[]
    with open(filename) as inputfile:
        for line in inputfile:
            rst.append(line.strip('\n'))
    return rst

def count_elements(tree_file, elements):
    count = 0
    for line in tree_file:
        for c in line:
            if c in elements:
                count = count + 1
    return count

###############################################################################
# TESTS
###############################################################################

def test_size(test_name, tree_in, tree_out):
    in_height = len(tree_in)
    in_width = len(tree_in[0])

    if (in_height != len(tree_out)):
        return FAILED(test_name)

    for line in tree_out:
        if (in_width != len(line)):
            return FAILED(test_name)

    return SUCCESS(test_name)

def test_aliens(test_name, tree_in, tree_out):
    for line in tree_out:
        for c in line:
            if c not in ELEMENTS:
                return FAILED(test_name)

    return SUCCESS(test_name)

def test_desert(test_name, tree_in, tree_out):
    green_count_in = count_elements(tree_in, TREE_ELEMENTS)
    green_count_out = count_elements(tree_out, TREE_ELEMENTS)

    if (green_count_in == 0 and green_count_out != 0):
        return FAILED(test_name)

    return SUCCESS(test_name)

def test_light(test_name, tree_in, tree_out):
    above = [True] * len(tree_in[0])
    light = []
    for line in tree_in:
        light_line = []
        for x in range(len(line)):
            rst = above[x] and line[x] not in "o-r"
            light_line.append(rst)
        above = light_line
        light.append(light_line)

    for y in range(len(tree_out)):
        for x in range(len(tree_out[0])):
            if (tree_out[y][x] in "fFtT" and not light[y][x]):
                return FAILED(test_name)

    return SUCCESS(test_name)

def test_root(test_name, tree_in, tree_out):
    for y in range(len(tree_out)):
        for x in range(len(tree_out[0])):
            if (tree_out[y][x] is "r" and tree_in[y][x] not in "r-"):
                return FAILED(test_name)

    return SUCCESS(test_name)

def test_old_trunk(test_name, tree_in, tree_out):
    for y in range(len(tree_in)):
        for x in range(len(tree_in[0])):
            if (tree_in[y][x] is "T" and tree_out[y][x] is not "T" ):
                return FAILED(test_name)

    return SUCCESS(test_name)

def test_young_trunk(test_name, tree_in, tree_out):
    for y in range(len(tree_in)):
        for x in range(len(tree_in[0])):
            if (tree_in[y][x] is "t" and tree_out[y][x] not in "tT" ):
                return FAILED(test_name)

    return SUCCESS(test_name)

def test_ground_solidity(test_name, tree_in, tree_out):
    for y in range(len(tree_in)):
        for x in range(len(tree_in[0])):
            if (tree_in[y][x] is "-" and tree_out[y][x] not in "-r" ):
                return FAILED(test_name)

    for y in range(len(tree_in)):
        for x in range(len(tree_in[0])):
            if (tree_in[y][x] is "o" and tree_out[y][x] is not "o" ):
                return FAILED(test_name)

    for y in range(len(tree_out)):
        for x in range(len(tree_out[0])):
            if (tree_out[y][x] in "o-" and tree_out[y][x] is not tree_in[y][x] ):
                return FAILED(test_name)

    return SUCCESS(test_name)

###############################################################################
# MAIN
###############################################################################

def main():
    tree_in = create_string_list_from_file(sys.argv[1])
    tree_out = create_string_list_from_file(sys.argv[2])

    test_size("TEST1", tree_in, tree_out)
    test_aliens("TEST2", tree_in, tree_out)
    test_desert("TEST3", tree_in, tree_out)
    test_light("TEST4", tree_in, tree_out)
    test_root("TEST5", tree_in, tree_out)
    test_old_trunk("TEST6", tree_in, tree_out)
    test_young_trunk("TEST7", tree_in, tree_out)
    test_ground_solidity("TEST8", tree_in, tree_out)

main()
