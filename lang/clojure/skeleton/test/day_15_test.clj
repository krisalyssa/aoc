(ns day-15-test
  (:require
   [clojure.test :refer :all]
   [day-15 :refer :all]))

(deftest day-15-test
  (testing "sample data"
    (is (= 0 (part1 "../data/15-sample.txt")))
    (is (= 0 (part2 "../data/15-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/15.txt")))
    (is (= 0 (part2 "../data/15.txt")))))
