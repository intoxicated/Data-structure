package main

import (
    "intoxicated/list"
)

func main() {
    lst := list.NewList(false)

    lst.Insert(5)
    lst.Insert(7)

    lst.InsertAt(2, 1)

    lst.PrintList()
}
