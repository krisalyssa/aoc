(ns day-24-test
  (:require
   [clojure.test :refer :all]
   [day-24 :refer :all]))

(deftest day-24-test
  (testing "sample data"
    (is (= 0 (part1 "../data/24-sample.txt")))
    (is (= 0 (part2 "../data/24-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/24.txt")))
    (is (= 0 (part2 "../data/24.txt")))))
