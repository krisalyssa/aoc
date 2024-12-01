(ns day-25-test
  (:require
   [clojure.test :refer :all]
   [day-25 :refer :all]))

(deftest day-25-test
  (testing "sample data"
    (is (= 0 (part1 "../data/25-sample.txt")))
    (is (= 0 (part2 "../data/25-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/25.txt")))
    (is (= 0 (part2 "../data/25.txt")))))
