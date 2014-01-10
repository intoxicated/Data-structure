package main

import (
    "./linkedlist"
    //"fmt"
)

func main() {
    lst := linkedlist.NewList(false)

    lst.Insert(5)
    lst.Insert(7)

    lst.InsertAt(2, 1)

    lst.PrintList()
}
