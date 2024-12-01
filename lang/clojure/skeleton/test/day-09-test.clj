(ns day-09-test
  (:require
   [clojure.test :refer :all]
   [day-09 :refer :all]))

(deftest day-09-test
  (testing "sample data"
    (is (= 0 (part1 "../data/09-sample.txt")))
    (is (= 0 (part2 "../data/09-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/09.txt")))
    (is (= 0 (part2 "../data/09.txt")))))
