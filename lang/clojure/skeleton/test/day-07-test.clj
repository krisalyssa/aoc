(ns day-07-test
  (:require
   [clojure.test :refer :all]
   [day-07 :refer :all]))

(deftest day-07-test
  (testing "sample data"
    (is (= 0 (part1 "../data/07-sample.txt")))
    (is (= 0 (part2 "../data/07-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/07.txt")))
    (is (= 0 (part2 "../data/07.txt")))))
