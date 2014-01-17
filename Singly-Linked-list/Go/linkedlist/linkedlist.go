package linkedlist

import (
    "fmt"
)

type linkedlist struct {
    head    *node
    size    int
    isFixed bool
}

type node struct {
    value int
    next  *node
}

func NewList(fixed bool) *linkedlist {
    l := new(linkedlist)
    l.size = 0
    l.isFixed = fixed
    l.head = new(node)
    return l
}

func (l *linkedlist) Insert(value int) {
    l.head = &node{value: value, next: l.head}
    l.size = l.size + 1
}

func (l linkedlist) InsertAt(value int, loc int) {
    if l.size < loc {
        fmt.Errorf("Cannot insert into list, location is bigger than size")
        return
    }

    prev := l.head
    next := l.head.next

    if loc == 0 {
        l.Insert(value)
    }

    for i := 1; i < loc; i++ {
        prev = prev.next
        next = next.next
    }
    //now in middle of list
    newNode := new(node)
    newNode.value = value

    prev.next = newNode
    newNode.next = next

}

func (l linkedlist) Remove(value int) bool {
    prev := l.head
    current := l.head.next

    isDeleted := false

    if l.head.next == nil {
        fmt.Errorf("List is empty\n")
        return false
    }
    //head is match value
    if prev.value == value {
        l.head = l.head.next
        prev.next = nil
        isDeleted = true
        l.size -= 1
        return isDeleted
    }

    //if not head then traverse list
    for current.value != value {
        prev = prev.next
        current = current.next
    }

    if current.value == value {
        prev.next = current.next
        current.next = nil
        isDeleted = true
        l.size -= 1
    } else {
        fmt.Errorf("value %d is not found\n", value)
    }

    return isDeleted
}

func (l linkedlist) RemoveAt(loc int) {

}

func (l linkedlist) PrintList() {
    var tempNode = l.head
    for tempNode != nil {
        if tempNode.next != nil {
            fmt.Printf("%d -> ", tempNode.value)
        } else {
            fmt.Printf("%d\n", tempNode.value)
        }
        tempNode = tempNode.next
    }

}
