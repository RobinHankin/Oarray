test_that("multiplication works", {
    a <- array(1:24,2:4)
    b <- array(sample(1:24),2:4)
    Oa <- as.Oarray(a,offset = 0)
    Ob <- as.Oarray(b,offset = 0)

    expect_true(is.Oarray(Oa))
    expect_output(print(Oa))

    expect_true(all(Oa + Ob == as.Oarray(a + b , offset = 0)))

    expect_true(identical(as.array(Oa), a))
    expect_true(identical(as.array(Ob), b))

    expect_true(a[1,2,1] == Oa[0,1,0])
    expect_true(b[1,2,1] == Ob[0,1,0])

    jj <- Oa
    jj[0, 2, 0] <- 34
    expect_true(jj[0, 2, 0] == 34)

    jj <- Oa
    jj[cbind(1,0,0)] <- 44
    expect_true(jj[cbind(1,0,0)] == 44)

    jj <-   sort(unique(c(slice.index(Oa,1))))
    save(jj,file = "~/ww")

} )
