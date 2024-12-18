(ns day-02-test
  (:require
   [clojure.test :refer :all]
   [day-02 :refer :all]))

(deftest day-02-test
  (testing "sample data"
    (is (= 0 (part1 "../data/02-sample.txt")))
    (is (= 0 (part2 "../data/02-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/02.txt")))
    (is (= 0 (part2 "../data/02.txt")))))
