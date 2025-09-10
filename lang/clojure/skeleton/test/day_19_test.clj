(ns day-19-test
  (:require
   [clojure.test :refer :all]
   [day-19 :refer :all]))

(deftest day-19-test
  (testing "sample data"
    (is (= 0 (part1 "../data/19-sample.txt")))
    (is (= 0 (part2 "../data/19-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/19.txt")))
    (is (= 0 (part2 "../data/19.txt")))))
