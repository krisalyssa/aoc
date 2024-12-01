(ns day-05-test
  (:require
   [clojure.test :refer :all]
   [day-05 :refer :all]))

(deftest day-05-test
  (testing "sample data"
    (is (= 0 (part1 "../data/05-sample.txt")))
    (is (= 0 (part2 "../data/05-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/05.txt")))
    (is (= 0 (part2 "../data/05.txt")))))
