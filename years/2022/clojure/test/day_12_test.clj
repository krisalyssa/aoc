(ns day-12-test
  (:require
   [clojure.test :refer :all]
   [day-12 :refer :all]))

(deftest day-12-test
  (testing "sample data"
    (is (= 31 (part1 "../data/12-sample.txt")))
    (is (= 29 (part2 "../data/12-sample.txt"))))
  (testing "puzzle data"
    (is (= 330 (part1 "../data/12.txt")))
    (is (= 321 (part2 "../data/12.txt")))))
