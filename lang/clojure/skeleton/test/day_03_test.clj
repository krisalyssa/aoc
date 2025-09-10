(ns day-03-test
  (:require
   [clojure.test :refer :all]
   [day-03 :refer :all]))

(deftest day-03-test
  (testing "sample data"
    (is (= 0 (part1 "../data/03-sample.txt")))
    (is (= 0 (part2 "../data/03-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/03.txt")))
    (is (= 0 (part2 "../data/03.txt")))))
