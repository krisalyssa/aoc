(ns day-01-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-01 :refer [part1 part2]]))

(deftest day-01-test
  (testing "sample data"
    (is (= 0 (part1 "../data/01-sample.txt")))
    (is (= 0 (part2 "../data/01-sample.txt")))))
