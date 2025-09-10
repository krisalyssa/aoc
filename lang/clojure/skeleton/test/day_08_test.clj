(ns day-08-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-08 :refer [part1 part2]]))

(deftest day-08-test
  (testing "sample data"
    (is (= 0 (part1 "../data/08-sample.txt")))
    (is (= 0 (part2 "../data/08-sample.txt")))))
