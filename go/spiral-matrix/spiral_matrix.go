package spiralmatrix

func SpiralMatrix(size int) [][]int {
    spiral := make([][]int, size)
    for i := range spiral {
        spiral[i] = make([]int, size)
    }

    directions := [][]int{{0, 1}, {1, 0}, {0, -1}, {-1, 0}}
    i, j, di := 0, 0, 0

    for n := 1; n <= size*size; n++ {
        spiral[i][j] = n

        ni, nj := i + directions[di][0], j + directions[di][1]

        if ni < 0 || ni >= size || nj < 0 || nj >= size || spiral[ni][nj] != 0 {
            di = (di + 1) % 4
            ni, nj = i + directions[di][0], j + directions[di][1]
        }

        i, j = ni, nj
    }

    return spiral
}
