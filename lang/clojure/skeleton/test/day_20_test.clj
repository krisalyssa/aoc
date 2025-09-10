(ns day-20-test
  (:require
   [clojure.test :refer :all]
   [day-20 :refer :all]))

(deftest day-20-test
  (testing "sample data"
    (is (= 0 (part1 "../data/20-sample.txt")))
    (is (= 0 (part2 "../data/20-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/20.txt")))
    (is (= 0 (part2 "../data/20.txt")))))
