(ns day-23-test
  (:require
   [clojure.test :refer :all]
   [day-23 :refer :all]))

(deftest day-23-test
  (testing "sample data"
    (is (= 0 (part1 "../data/23-sample.txt")))
    (is (= 0 (part2 "../data/23-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/23.txt")))
    (is (= 0 (part2 "../data/23.txt")))))
