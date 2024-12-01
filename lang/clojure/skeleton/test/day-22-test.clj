(ns day-22-test
  (:require
   [clojure.test :refer :all]
   [day-22 :refer :all]))

(deftest day-22-test
  (testing "sample data"
    (is (= 0 (part1 "../data/22-sample.txt")))
    (is (= 0 (part2 "../data/22-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/22.txt")))
    (is (= 0 (part2 "../data/22.txt")))))
