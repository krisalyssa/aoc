(ns day-17-test
  (:require
   [clojure.test :refer :all]
   [day-17 :refer :all]))

(deftest day-17-test
  (testing "sample data"
    (is (= 0 (part1 "../data/17-sample.txt")))
    (is (= 0 (part2 "../data/17-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/17.txt")))
    (is (= 0 (part2 "../data/17.txt")))))
